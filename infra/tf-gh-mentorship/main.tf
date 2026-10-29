resource "github_repository" "mentorship-app" {
  name        = "mentorship-app"

  visibility = "public"
  has_issues = true
  has_projects = true
}

resource "github_branch_protection" "mentorship-app" {
  repository_id = github_repository.mentorship-app.id


  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true

  required_pull_request_reviews {
    dismiss_stale_reviews = true
    restrict_dismissals   = true
  }
}