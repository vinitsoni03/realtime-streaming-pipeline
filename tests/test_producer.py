from producer.data_generator import generate_record


def test_generate_record():
    record = generate_record()
    assert 'record_id' in record
    assert 'timestamp' in record
    assert 'value' in record
    assert 'source' in record
