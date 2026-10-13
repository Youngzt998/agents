# Project repositories

- Every personal project has two git repositories. The project repo holds the
  code. The design repo holds the author's personal documents, slides, paper
  drafts and AI workflows.
- The project repo is checked out inside the design repo's working directory
  and listed in its `.gitignore`. Nothing from the project repo is committed to
  the design repo.
- Cloning the design repo and running `setup/bootstrap.sh` recreates the
  checkouts and the environment on a new machine.
- `/init-project <project-repo-remote> <design-repo-remote>` starts a project,
  following `workflows/init-project.md`.

Author: "把这个工作模式创建为我个人的所有的项目开发一种模式，就是项目设计和项目代码本身两个git repo做分离，设计repo作为personal的文档、slides making、paper writting。启动方式为在prompt里面/init-project  然后告知项目repo和设计repo的remote链接"
(English: "make this way of working the mode for all of my personal projects:
project design and project code are two separate git repos, and the design repo
holds personal documents, slide making and paper writing; it is started by typing
/init-project and giving the remotes of the project repo and the design repo").
