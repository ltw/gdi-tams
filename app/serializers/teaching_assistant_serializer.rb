class TeachingAssistantSerializer < ActiveModel::Serializer
  embed :ids, include: true

  has_many :courses

  attributes  :id,
              :email,
              :name,
              :private_id,
              :status

  def status
    object.status.label
  end
end
