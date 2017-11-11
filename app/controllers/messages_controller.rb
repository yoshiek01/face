class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
    #どの会話かを特定

  def index
    @messages = @conversation.messages

    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    #メッセージ数が10以上ならメッセージ一覧表示を10に絞る

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    #10以下ならメッセージをすべて取得

    if @messages.last
      if @messages.last.user_id != current_user.id
         @messages.last.read = true
      end
    end
    #メッセージが最新のもので、ユーザIDが自分でなければ、そのメッセージを既読にする
    #last = 配列の最後の要素を返す

    @message = @conversation.messages.build
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to blogs_path ,notice: "ブログを作成しました！"

      redirect_to conversation_messages_path(@conversation), notice: "メッセージを送信しました！"

    else
     render 'new'
    end

  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end

 end
end
