from consumer.transformer import transform_record


def test_transform_record():
    input_record = {
        'id': 1,
        'timestamp': 1234567890,
        'value': 5
    }
    transformed = transform_record(input_record)
    assert transformed['value_squared'] == 25
    assert 'processed_at' in transformed
