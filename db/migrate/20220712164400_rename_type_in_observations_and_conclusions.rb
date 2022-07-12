class RenameTypeInObservationsAndConclusions < ActiveRecord::Migration[7.0]

  def change

    rename_column :observations, :type, :observation_type
    rename_column :conclusions, :type, :conclusion_type

  end

end
