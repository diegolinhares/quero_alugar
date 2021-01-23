alias QueroAlugar.Repo

alias QueroAlugar.Vacation.{Booking, Place, Review}
alias QueroAlugar.Accounts.User

# Users

luke =
  %User{}
  |> User.changeset(%{
    username: "luke",
    email: "luke@skywalker.com",
    password: "rebel"
  })
  |> Repo.insert!()
