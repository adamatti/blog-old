require 'rake-jekyll'

# This task builds the Jekyll site and deploys it to a remote Git repository.
# It's preconfigured to be used with GitHub and Travis CI.
# See http://github.com/jirutka/rake-jekyll for more options.
Rake::Jekyll::GitDeployTask.new(:deploy) do |t|
  # Description of the rake task.
  t.description = 'Generate the site and push changes to remote repository'

  # Overrides the *author* of the commit being created with author of the
  # source commit (i.e. HEAD in the current branch).
  t.author = -> {
    `git log -n 1 --format='%aN <%aE>'`.strip
  }
  # Overrides the *author date* of the commit being created with date of the
  # source commit.
  t.author_date = -> {
    `git log -n 1 --format='%aD'`.strip
  }
  # The commit message will contain hash of the source commit.
  t.commit_message = -> {
    "Built from #{`git rev-parse --short HEAD`.strip}"
  }
  # Use 'Jekyll' as the default *committer* name (with empty email) when the
  # user.name is not set in git config.
  t.committer = 'Jekyll'

  # Deploy the built site into remote branch named 'gh-pages', or 'master' if
  # the remote repository URL matches `#{gh_user}.github.io.git`.
  # It will be automatically created if not exist yet.
  t.deploy_branch = -> {
    gh_user = ENV['TRAVIS_REPO_SLUG'].to_s.split('/').first
    remote_url.match(/[:\/]#{gh_user}\.github\.io\.git$/) ? 'master' : 'gh-pages'
  }
  # Run this command to build the site.
  t.build_script = ->(dest_dir) {
    puts "\nRunning Jekyll..."
    sh "bundle exec jekyll build --destination #{dest_dir}"
  }
  # Use the default committer (configured in git) when available.
  t.override_committer = false
end
