Blogging Platform (Ruby on Rails)

A full-featured blogging application built with Ruby on Rails. Users can sign up, create posts, comment on others’ posts, and search posts by keywords. This project demonstrates core Rails concepts including MVC architecture, Devise authentication, CRUD operations, associations, and custom styling.

Features

User Authentication (Devise)
- Users can sign up, log in, and log out securely.
- Only logged-in users can create posts or comments.
- Visitors can view all posts and comments.

Posts (CRUD Operations)
- Each post has a title and content.
- A post belongs to a user.
- Users can create, edit, delete, and view posts.
- Only the author can edit or delete their posts.

Comments
- Users can add comments to any post.
- A comment belongs to both a post and a user.
- Comments are displayed on each post's page.

Search
- Users can search posts by title or content (case-insensitive).
- Implemented using a simple SQL query in the model.

Styling
- Custom CSS for post forms, comment sections, and layout.
- Clean and responsive UI using semantic class names.

Tech Stack

- Ruby on Rails 8.1.1
- Ruby 3.x
- PostgreSQL
- Devise (authentication)
- ERB templates
- Propshaft (asset pipeline)
- GitHub Actions (CI)

Getting Started : 
Installation and Setup

1. Clone the repository
   git clone https://github.com/Manjunath-kondabathini/blog_app
   cd blog_app

2. Install dependencies
   bundle install
   yarn install

3. Set up the database
   rails db:create
   rails db:migrate

4. Run the server
   rails server

5. Visit the app
   Open http://localhost:3000 in your browser.

How It Works

Authentication
- Handled by Devise.
- Users must log in before creating or editing posts and comments.

Posts
- Implemented in PostsController.
- Uses standard Rails CRUD actions.
- Validates presence of title and content.

Comments
- Implemented in CommentsController.
- Nested under posts: /posts/:post_id/comments.
- Each comment belongs to a post and a user.

Search
- Implemented in the Post model:
  def self.search(keyword)
    where("title ILIKE ? OR content ILIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
- Controlled via PostsController#index.

Folder Structure

app/
 ├── controllers/
 │   ├── posts_controller.rb
 │   ├── comments_controller.rb
 │   └── application_controller.rb
 ├── models/
 │   ├── post.rb
 │   ├── comment.rb
 │   └── user.rb
 ├── views/
 │   ├── posts/
 │   ├── comments/
 │   └── layouts/
 └── assets/
     └── stylesheets/application.css

Author

Manjunath Kondabathini  
Bachelor of Engineering in Computer Science  
Aspiring Ruby on Rails Developer  
Email: kondabathinimanjunath@gmail.com  
GitHub: https://github.com/Manjunath-kondabathini


