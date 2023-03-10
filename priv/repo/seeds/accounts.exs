
defmodule Yindlo.Repo.Seeds.Accounts do
  alias Yindlo.Repo
  alias Yindlo.Accounts.User

  @user File.read!("priv/fake/user.txt") |> String.split("\n")

  def run do
    seed_users()
  end


  def seed_users do
    case Repo.all(User) do
      [] ->
        for user <- @user do
          email =
            String.downcase(user)
            |> String.normalize(:nfd)
            |> String.replace(~r/[^A-z\s]/u, "")
            |> String.replace(" ", "_")

          %{
            email: email <> "@mail.pt",
            password: "Password1234",
            role: :user
          }
          |> insert_user()
        end


        [
          %{
            email: "pedro@gmail.com",
            password: "Password1234",
            role: :admin
          },
          %{
            email: "helder@gmail.com",
            password: "Password1234",
            role: :admin
          }
        ]
        |> Enum.each(&insert_user/1)

      _ ->
        Mix.shell().error("Found users, aborting seeding users.")
    end
  end

  defp insert_user(attrs \\ []) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert!()
  end
end

Yindlo.Repo.Seeds.Accounts.run()
