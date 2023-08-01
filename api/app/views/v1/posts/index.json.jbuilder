json.array! @posts do |post|
  json.id post.id
  json.content post.content
  json.created_at post.created_at
  json.updated_at post.updated_at

  json.agree_votes post.votes.where(vote_type: true).count
  json.disagree_votes post.votes.where(vote_type: false).count

end
