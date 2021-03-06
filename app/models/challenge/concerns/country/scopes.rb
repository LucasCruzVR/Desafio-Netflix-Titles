module Challenge
  module Concerns
    module Country
      module Scopes
        extend ActiveSupport::Concern

        included do
          scope :by_name, lambda { |country|
            where('countries.name = ?', country) if country.present?
          }

          scope :by_name_ilike, lambda { |country|
            where('countries.name ILIKE ?', "%#{country}%") if country.present?
          }
        end
      end
    end
  end
end
