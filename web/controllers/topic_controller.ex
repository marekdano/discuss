defmodule Discuss.TopicController do
	use Discuss.Web, :controller

	alias Discuss.Topic

	def index(conn, _params) do
		topics = Repo.all(Topic)

		render conn, "index.html", topics: topics
	end 

	def new(conn, _params) do
		# struct = %Topic{}
		# params = %{}
		# changeset = Topic.changeset(struct, params)
		changeset = Topic.changeset(%Topic{}, %{})

		render conn, "new.html", changeset: changeset
	end

	def create(conn, %{"topic" => topic} = params) do
		changeset = Topic.changeset(%Topic{}, topic)

		case Repo.insert(changeset) do
			{:ok, post} -> 
				conn 
				|> put_flash(:info, "Topic created.")
				|> redirect(to: topic_path(conn, :index))
			{:error, changeset} -> 
				conn
				|> put_flash(:error, "Topic has not been created.")
				|> render("new.html", changeset: changeset)
		end
	end

	def edit(conn, %{"id" => topic_id}) do
		topic = Repo.get(Topic, topic_id)
		changeset = Topic.changeset(topic)

		render conn, "edit.html", changeset: changeset, topic: topic
	end 
end