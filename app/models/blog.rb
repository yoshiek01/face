class Blog < ActiveRecord::Base
    validates :title, presence: true
    belongs_to :user
    # CommentモデルのAssociationを設定
    has_many :comments, dependent: :destroy
    #dependent::destroyを設定することで
    #Blogモデルが削除された時に紐づくコメントのレコードも削除される
end
