crumb :root do
  link "ホーム", root_path
end

crumb :user do |user|
  link "#{user.name}", user_path(user)
  parent :root
end

crumb :edit_user do |user|
  link "プロフィール編集", edit_user_path(user)
  parent :user, user
end

crumb :new_shop do
  link "店舗登録", new_shop_path
  parent :root
end

crumb :shops do
  link "店名・駅名から探す", shops_path
  parent :root
end

crumb :shop do |shop|
  link "#{shop.name+shop.branch}", shop_path(shop)
  parent :shops
end

crumb :edit_shop do |shop|
  link "店舗編集", edit_shop_path(shop)
  parent :shop, shop
end

crumb :shop_places do
  link "位置情報から探す", shops_places_path
  parent :root
end

# crumb :shop_shop_images do |shop_images|
#   link "写真一覧", shop_shop_images_path
#   parent :shop, shop
# end

crumb :post do |post|
  link "レビュー詳細", post_path(post)
  parent :shop, post.shop
end

crumb :edit_post do |post|
  link "レビュー編集", edit_post_path(post)
  parent :post, post
end

crumb :shop_post_new do |post|
  link "レビューを書く", shop_post_new_path
  parent :shop, post.shop
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
