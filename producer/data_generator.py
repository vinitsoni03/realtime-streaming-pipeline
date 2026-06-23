import random
import time
import uuid


def generate_record():
    return {
        'record_id': str(uuid.uuid4()),
        'timestamp': time.time(),
        'value': random.randint(0, 100),
        'source': 'test_producer'
    }
