module CommentsHelper

    def comment_choose_new_or_edit
     if action_name == 'new'
       blog_comments_path(@blog,@comment_id)
     #もしnewアクションならコメント一覧へ
     
     elsif action_name == 'edit'
       blog_comment_path(@comment_id)
     #もしeditアクションでもコメント一覧へ
     
     end
    end
end
