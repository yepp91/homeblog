class Homeblog.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    text: null
    created_at: null
    updated_at: null

class Homeblog.Collections.PostsCollection extends Backbone.Collection
  model: Homeblog.Models.Post
  url: '/posts'
