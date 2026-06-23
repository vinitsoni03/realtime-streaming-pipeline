from collections import defaultdict


class WindowedAggregator:
    def __init__(self, window_size_seconds=60):
        self.window_size = window_size_seconds
        self.windows = defaultdict(list)

    def add(self, record):
        window_key = int(record['timestamp'] // self.window_size)
        self.windows[window_key].append(record['value'])

    def get_window_stats(self, window_key):
        values = self.windows.get(window_key, [])
        if not values:
            return None
        return {
            'count': len(values),
            'sum': sum(values),
            'avg': sum(values) / len(values),
            'min': min(values),
            'max': max(values)
        }
