# Model 
- Userにはgroup_idとusernameが必要
- Groupは招待メールにセットすべきか
- activerecordが日本語化しないよ？？？ -> しましたが？

# View
- CSSはmaterlizeを使用する  [ref](https://materializecss.com/)  
- 個別なのはどうする 
- current_user.schedulesのものもつくること   
- react使って”終日”を入れるか？ 


# Controller
- 表示するのはgroup.usersの今日の予定だけでいい 。他は無視  

# Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

