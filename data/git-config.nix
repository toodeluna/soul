{
  aliases = {
    lga = "log --all --decorate --graph --oneline";
    put = "push --set-upstream";
  };

  config = {
    init.defaultBranch = "main";
    core.ignorecase = false;
    pull.rebase = true;
  };
}
