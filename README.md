# Sidekick container for p42/wordpress to run scheduled operations.

* This is a simple container extending the Rancher Library's crontab container. In our instance we needed to have git installed so this container extends that container by installing git.