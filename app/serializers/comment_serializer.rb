class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :is_own_comment

  belongs_to :user

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end

  def is_own_comment
    object.user_id == scope.id
  end
end
