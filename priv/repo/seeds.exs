alias QueroAlugar.Repo

alias QueroAlugar.Vacation.{Booking, Place, Review}
alias QueroAlugar.Accounts.User

%User{}
|> User.changeset(%{
  username: "luke",
  email: "luke@skywalker.com",
  password: "rebels"
})
|> Repo.insert!()
