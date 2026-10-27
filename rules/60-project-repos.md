# Project repositories

- Every personal project has two git repositories. The project repo holds the
  code. The design repo holds the author's personal documents, slides and AI
  workflows.
- A project with a paper has a third repository, the paper repo, which holds the
  paper's LaTeX source. The paper repo is optional.
- The project repo is checked out inside the design repo's working directory
  and listed in its `.gitignore`. The paper repo is checked out the same way, at
  `paper/`. Code from the project repo is never committed to the design repo.
- Cloning the design repo and running `setup/bootstrap.sh` recreates the
  checkouts and the environment on a new machine. `PAPER_URL` in
  `setup/config.sh` names the paper repo. An empty `PAPER_URL` means the project
  has none.
- `/init-project <project-repo-remote> <design-repo-remote> [<paper-repo-remote>]`
  starts a project, following `workflows/init-project.md`. To add a paper repo
  later, set `PAPER_URL` and run `setup/bootstrap.sh` again.

Author: "把这个工作模式创建为我个人的所有的项目开发一种模式，就是项目设计和项目代码本身两个git repo做分离，设计repo作为personal的文档、slides making、paper writting。启动方式为在prompt里面/init-project  然后告知项目repo和设计repo的remote链接"
(English: "make this way of working the mode for all of my personal projects:
project design and project code are two separate git repos, and the design repo
holds personal documents, slide making and paper writing; it is started by typing
/init-project and giving the remotes of the project repo and the design repo").

Author (2026-10-27): "说明paper writting要作为一个optional的子repo放在design repo下面，就像coding repo一样"
(English: "state that paper writing goes in an optional sub-repo under the design
repo, the same as the code repo").
