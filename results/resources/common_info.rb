module BestestResults

  # define cases for section 5.2.3
  def self.populate_common_info()

    hash = {}

    hash[:program_name_and_version] = "EnergyPlus 8.6.0"
    hash[:program_version_release_date] = "9//30/2016"
    hash[:program_name_short] = "E+"
    hash[:results_submission_date] = "11/1/2016"
    hash[:organization] = "National Renewable Energy Laboratory"
    hash[:organization_short] = "NREL"

    return hash

  end

end