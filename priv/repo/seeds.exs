# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Wabanex.Repo.insert!(%Wabanex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Wabanex.{Repo, User, Training}

user = Repo.insert!(%User{
  email: "johndoe@email.com",
  name: "John Doe",
  password: "password"
})

Repo.insert!(%Training{
  start_date: ~D[2021-05-01],
  end_date: ~D[2021-06-30],
  user_id: user.id,
  exercises: [
    %{
      name: "Triceps banco",
      youtube_video_url: "https://www.youtube.com",
      protocol_description: "regular",
      repetitions: "2x6"
    },
    %{
      name: "Triceps corda",
      youtube_video_url: "https://www.youtube.com",
      protocol_description: "regular",
      repetitions: "3x12"
    },
    %{
      name: "Triceps",
      youtube_video_url: "https://www.youtube.com",
      protocol_description: "regular",
      repetitions: "4x10"
    }
  ]
})

Repo.insert!(%Training{
  start_date: ~D[2021-07-01],
  end_date: ~D[2021-08-31],
  user_id: user.id,
  exercises: [
    %{
      name: "Triceps banco",
      youtube_video_url: "https://www.youtube.com",
      protocol_description: "regular",
      repetitions: "2x6"
    },
    %{
      name: "Triceps corda",
      youtube_video_url: "https://www.youtube.com",
      protocol_description: "regular",
      repetitions: "3x12"
    },
    %{
      name: "Triceps",
      youtube_video_url: "https://www.youtube.com",
      protocol_description: "regular",
      repetitions: "4x10"
    }
  ]
})
