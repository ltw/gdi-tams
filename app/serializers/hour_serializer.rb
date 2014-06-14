class HourSerializer < ActiveModel::HourSerializer
  embed :ids, include: true
end