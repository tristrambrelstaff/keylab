class Document < ApplicationRecord

  require "empty_where_fix"

  has_many :keys, dependent: :destroy

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
      read_doc(Nokogiri::XML::Document.parse(xml) {|options| options.noblanks.strict}.root)
    rescue Nokogiri::XML::SyntaxError => e
      @xml_errors << "invalid character (probably an unescaped < or &) at line #{e}"
    end
  end

  def read_doc(node)
    return if errors.any?
    if node.name == "doc"
      ### TODO ###
    else
      @xml_errors << "expecting <doc> but found <#{node.name}> at line #{node.line}"
    end
  end

  def Document.searcher(params)
    joins = []
    conds = []
    vals = []
    unless params[:id].blank?
      conds << "documents.id = ?"
      vals << params[:id]
    end
    unless params[:ref].blank?
      conds << "documents.ref LIKE ?"
      vals << "%#{params[:ref]}%"
    end
    unless params[:citation].blank?
      conds << "documents.citation LIKE ?"
      vals << "%#{params[:citation]}%"
    end
    unless params[:language].blank?
      conds << "documents.language = ?"
      vals << params[:language]
    end
    OpenStruct.new(
      :joins => joins.uniq,
      :conds => empty_where_fix(conds),
      :vals => vals
    )
  end

end
