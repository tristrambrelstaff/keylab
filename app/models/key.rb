class Key < ApplicationRecord

  require "empty_where_fix"

  belongs_to :document, optional: true  # Just temporarily optional

  def initialize(params)
    @xml_errors = []
    super(params)
  end

  validate :no_xml_errors

  def no_xml_errors
    @xml_errors.each do |xml_error|
      errors.add(:xml, "error: #{xml_error}")
    end
  end

  def xml=(uploaded_file)
    super(File.read(uploaded_file.to_path))
    begin
      read_key(Nokogiri::XML::Document.parse(xml) {|options| options.noblanks.strict}.root)
    rescue Nokogiri::XML::SyntaxError => e
      @xml_errors << "invalid character (probably an unescaped < or &) at line #{e}"
    end
  end

  def read_key(node)
    if node.name == "key"
      ### TODO ###
    else
      @xml_errors << "expecting <key> but found <#{node.name}> at line #{node.line}"
    end
  end

  def Key.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "keys.id = ?"
      vals << params[:id]
    end
    unless params[:ref].blank?
      conds << "keys.ref LIKE ?"
      vals << "%#{params[:ref]}%"
    end
    unless params[:document_ref].blank?
      joins << "JOIN documents ON documents.id = keys.document_id"
      conds << "documents.ref LIKE ?"
      vals << "%#{params[:document_ref]}%"
    end
    unless params[:document_id].blank?
      conds << "keys.document_id = ?"
      vals << params[:document_id]
    end
    unless params[:title].blank?
      conds << "keys.title LIKE ?"
      vals << "%#{params[:title]}%"
    end
    unless params[:language].blank?
      conds << "keys.language = ?"
      vals << params[:language]
    end
    unless params[:notes].blank?
      conds << "keys.notes LIKE ?"
      vals << "%#{params[:notes]}%"
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end
