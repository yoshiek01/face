class ConversationsController < ApplicationController
  before_action :authenticate_user!
  #ログインしているときのみ

  def index
    @users = User.all
    @conversations = Conversation.all
  end

  def create
    #senderが送り主で`recipientが受取人

    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
    #該当のユーザ間での会話が過去に存在しているかを確認するか？
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      #会話を取得
    else
      @conversation = Conversation.create!(conversation_params)
      #強制的にメッセージを生成
    end

    redirect_to conversation_messages_path(@conversation)
    #その会話に紐づくメッセージの一覧画面へ
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
