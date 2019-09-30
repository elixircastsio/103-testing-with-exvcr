defmodule Teacher.Coins.CoinServiceTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup do
    HTTPoison.start
    ExVCR.Config.cassette_library_dir("fixture/coin_cassettes")
    :ok
  end

  describe "CoinService.fetch_current_price/1" do
    test "current price fetched" do
      use_cassette "price_fetch_success" do
        {:ok, price} = Teacher.Coins.CoinService.fetch_current_price("bitcoin")
        assert price == 8076.360689466207
      end
    end

    test "invalid coin used" do
      use_cassette "price_fetch_error" do
        {:error, msg} = Teacher.Coins.CoinService.fetch_current_price("elixircoin")
        assert msg == "No coin found"
      end
    end

  end
end
