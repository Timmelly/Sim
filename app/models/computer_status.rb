class ComputerStatus < ApplicationRecord
  belongs_to :computer
  STATUSES=["Выключен", "Активен", "В сети, но не отвечает"]
  validates :status, inclusion: {in: (0...STATUSES.size).to_a}
end
