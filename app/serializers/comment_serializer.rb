class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at

  belongs_to :user

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end
end
