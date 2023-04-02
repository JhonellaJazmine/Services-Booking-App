class Service < ApplicationRecord
    belongs_to :category
    belongs_to :location

    def available_days_display
        available_days.map { |day| Date::DAYNAMES[day] }.join(", ")
      end
end
