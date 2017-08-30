defmodule Discuss.TopicController do
	use Discuss.Web, :controller

	alias Discuss.Topic

	def new(conn, params) do
		# struct = %Topic{}
		# params = %{}
		# changeset = Topic.changeset(struct, params)
		changeset = Topic.changeset(%Topic{}, %{})

		render conn, "new.html", changeset: changeset
	end
end