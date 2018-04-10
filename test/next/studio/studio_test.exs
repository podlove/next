defmodule Next.StudioTest do
  use Next.DataCase

  alias Next.Studio

  describe "networks" do
    alias Next.Studio.Network

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def network_fixture(attrs \\ %{}) do
      {:ok, network} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studio.create_network()

      network
    end

    test "list_networks/0 returns all networks" do
      network = network_fixture()
      assert Studio.list_networks() == [network]
    end

    test "get_network!/1 returns the network with given id" do
      network = network_fixture()
      assert Studio.get_network!(network.id) == network
    end

    test "create_network/1 with valid data creates a network" do
      assert {:ok, %Network{} = network} = Studio.create_network(@valid_attrs)
      assert network.name == "some name"
    end

    test "create_network/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studio.create_network(@invalid_attrs)
    end

    test "update_network/2 with valid data updates the network" do
      network = network_fixture()
      assert {:ok, network} = Studio.update_network(network, @update_attrs)
      assert %Network{} = network
      assert network.name == "some updated name"
    end

    test "update_network/2 with invalid data returns error changeset" do
      network = network_fixture()
      assert {:error, %Ecto.Changeset{}} = Studio.update_network(network, @invalid_attrs)
      assert network == Studio.get_network!(network.id)
    end

    test "delete_network/1 deletes the network" do
      network = network_fixture()
      assert {:ok, %Network{}} = Studio.delete_network(network)
      assert_raise Ecto.NoResultsError, fn -> Studio.get_network!(network.id) end
    end

    test "change_network/1 returns a network changeset" do
      network = network_fixture()
      assert %Ecto.Changeset{} = Studio.change_network(network)
    end
  end

  describe "channels" do
    alias Next.Studio.Channel

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def channel_fixture(attrs \\ %{}) do
      {:ok, channel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studio.create_channel()

      channel
    end

    test "list_channels/0 returns all channels" do
      channel = channel_fixture()
      assert Studio.list_channels() == [channel]
    end

    test "get_channel!/1 returns the channel with given id" do
      channel = channel_fixture()
      assert Studio.get_channel!(channel.id) == channel
    end

    test "create_channel/1 with valid data creates a channel" do
      assert {:ok, %Channel{} = channel} = Studio.create_channel(@valid_attrs)
      assert channel.name == "some name"
    end

    test "create_channel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studio.create_channel(@invalid_attrs)
    end

    test "update_channel/2 with valid data updates the channel" do
      channel = channel_fixture()
      assert {:ok, channel} = Studio.update_channel(channel, @update_attrs)
      assert %Channel{} = channel
      assert channel.name == "some updated name"
    end

    test "update_channel/2 with invalid data returns error changeset" do
      channel = channel_fixture()
      assert {:error, %Ecto.Changeset{}} = Studio.update_channel(channel, @invalid_attrs)
      assert channel == Studio.get_channel!(channel.id)
    end

    test "delete_channel/1 deletes the channel" do
      channel = channel_fixture()
      assert {:ok, %Channel{}} = Studio.delete_channel(channel)
      assert_raise Ecto.NoResultsError, fn -> Studio.get_channel!(channel.id) end
    end

    test "change_channel/1 returns a channel changeset" do
      channel = channel_fixture()
      assert %Ecto.Changeset{} = Studio.change_channel(channel)
    end
  end

  describe "shows" do
    alias Next.Studio.Show

    @valid_attrs %{
      description: "some description",
      logo_url: "some logo_url",
      name: "some name",
      recording_date: "2010-04-17 14:00:00.000000Z",
      subtitle: "some subtitle"
    }
    @update_attrs %{
      description: "some updated description",
      logo_url: "some updated logo_url",
      name: "some updated name",
      recording_date: "2011-05-18 15:01:01.000000Z",
      subtitle: "some updated subtitle"
    }
    @invalid_attrs %{
      description: nil,
      logo_url: nil,
      name: nil,
      recording_date: nil,
      subtitle: nil
    }

    def show_fixture(attrs \\ %{}) do
      {:ok, show} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studio.create_show()

      show
    end

    test "list_shows/0 returns all shows" do
      show = show_fixture()
      assert Studio.list_shows() == [show]
    end

    test "get_show!/1 returns the show with given id" do
      show = show_fixture()
      assert Studio.get_show!(show.id) == show
    end

    test "create_show/1 with valid data creates a show" do
      assert {:ok, %Show{} = show} = Studio.create_show(@valid_attrs)
      assert show.description == "some description"
      assert show.logo_url == "some logo_url"
      assert show.name == "some name"

      assert show.recording_date ==
               DateTime.from_naive!(~N[2010-04-17 14:00:00.000000Z], "Etc/UTC")

      assert show.subtitle == "some subtitle"
    end

    test "create_show/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studio.create_show(@invalid_attrs)
    end

    test "update_show/2 with valid data updates the show" do
      show = show_fixture()
      assert {:ok, show} = Studio.update_show(show, @update_attrs)
      assert %Show{} = show
      assert show.description == "some updated description"
      assert show.logo_url == "some updated logo_url"
      assert show.name == "some updated name"

      assert show.recording_date ==
               DateTime.from_naive!(~N[2011-05-18 15:01:01.000000Z], "Etc/UTC")

      assert show.subtitle == "some updated subtitle"
    end

    test "update_show/2 with invalid data returns error changeset" do
      show = show_fixture()
      assert {:error, %Ecto.Changeset{}} = Studio.update_show(show, @invalid_attrs)
      assert show == Studio.get_show!(show.id)
    end

    test "delete_show/1 deletes the show" do
      show = show_fixture()
      assert {:ok, %Show{}} = Studio.delete_show(show)
      assert_raise Ecto.NoResultsError, fn -> Studio.get_show!(show.id) end
    end

    test "change_show/1 returns a show changeset" do
      show = show_fixture()
      assert %Ecto.Changeset{} = Studio.change_show(show)
    end
  end

  describe "items" do
    alias Next.Studio.Item

    @valid_attrs %{description: "some description", title: "some title", url: "some url", url_meta: %{}}
    @update_attrs %{description: "some updated description", title: "some updated title", url: "some updated url", url_meta: %{}}
    @invalid_attrs %{description: nil, title: nil, url: nil, url_meta: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Studio.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Studio.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Studio.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Studio.create_item(@valid_attrs)
      assert item.description == "some description"
      assert item.title == "some title"
      assert item.url == "some url"
      assert item.url_meta == %{}
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Studio.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Studio.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.description == "some updated description"
      assert item.title == "some updated title"
      assert item.url == "some updated url"
      assert item.url_meta == %{}
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Studio.update_item(item, @invalid_attrs)
      assert item == Studio.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Studio.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Studio.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Studio.change_item(item)
    end
  end
end
