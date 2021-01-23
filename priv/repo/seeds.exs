alias QueroAlugar.Repo

alias QueroAlugar.Vacations.{Booking, Place, Review}
alias QueroAlugar.Accounts.User

luke =
  %User{}
  |> User.changeset(%{
    username: "luke",
    email: "luke@skywalker.com",
    password: "rebels"
  })
  |> Repo.insert!()

%Place{
  name: "Sand Castle",
  slug: "sand-castle",
  description: "Build endless sand castles in your front yard",
  location: "Portugal",
  max_guests: 2,
  pet_friendly: false,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(195.00),
  image: "/sand-castle.jpg",
  image_thumbnail: "/sand-castle-thumb.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-10-18],
      end_date: ~D[2019-10-21],
      total_price: Decimal.from_float(585.00),
      user: luke
    }
  ]
}
|> Repo.insert!()

%Place{
  name: "Blue Igloo",
  slug: "blue-igloo",
  description: "Chill out!",
  location: "Canada",
  max_guests: 3,
  pet_friendly: false,
  pool: false,
  wifi: false,
  price_per_night: Decimal.from_float(100.00),
  image: "/blue-igloo.jpg",
  image_thumbnail: "/blue-igloo-thumb.jpg",
  bookings: [
    %Booking{
      start_date: ~D[2019-07-21],
      end_date: ~D[2019-07-31],
      total_price: Decimal.from_float(1000.00),
      user: luke
    }
  ],
  reviews: [
    %Review{
      comment: "It's a chillaxing experience! ❄️",
      rating: 5,
      user: luke,
      inserted_at: DateTime.from_naive!(~N[2019-03-26 22:00:00], "Etc/UTC")
    }
  ]
}
|> Repo.insert!()
