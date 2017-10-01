defmodule Discuss.CommentsChannel do
	use Discuss.Web, :channel
	alias Discuss.Topic

	def join("comments:" <> topic_id, _params, socket) do
		# IO.puts("+++++++")
		# IO.puts(topic_id)
		topic_id = String.to_integer(topic_id)
		topic = Repo.get(Topic, topic_id)
		
		{:ok, %{}, socket}
	end

	def handle_in(name, message, socket) do
		IO.puts("+++++++")
		IO.puts(name)
		IO.inspect(message)

		{:reply, :ok, socket}
	end
end