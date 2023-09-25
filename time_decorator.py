import time

# 定义一个装饰器工厂，接受参数`times`并返回实际的装饰器
def repeat_decorator(times=1):
    def decorator(func):
        def wrapper(*args, **kwargs):
            for _ in range(times):
                result = func(*args, **kwargs)
            return result
        return wrapper
    return decorator 

# 使用带参数的装饰器
@repeat_decorator(times=3)
def example_function():
    print("Function is executing!")
    time.sleep(1)

# 调用经过装饰的函数
example_function()
print("Function is ending!")
