from analytics.aggregator import WindowedAggregator


def test_windowed_aggregator():
    aggregator = WindowedAggregator(window_size_seconds=60)
    record1 = {'timestamp': 100, 'value': 10}
    record2 = {'timestamp': 110, 'value': 20}

    aggregator.add(record1)
    aggregator.add(record2)

    stats = aggregator.get_window_stats(1)
    assert stats['count'] == 2
    assert stats['sum'] == 30
