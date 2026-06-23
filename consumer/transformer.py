from datetime import datetime


def transform_record(record):
    transformed = record.copy()
    transformed['processed_at'] = datetime.utcnow().isoformat()
    transformed['value_squared'] = record.get('value', 0) ** 2
    return transformed
