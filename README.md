# Rack::Current

Sometimes, in the course of human events, you need to access the currently executing http request, and you
don't always have the luxury of passing it around, especially when you're working with frameworks that manage
the lifecycle of objects for you, or you want to include functionality from a module. That module might not have
a clean way of getting a reference to the request object.

### Rack::Current can help

CurrentRequest stores the current request in a thread local so that you can access it from anywhere inside the
request stack.

### Oooh. Thread locals, I hear those are dangerous.

Not really. There are certain objects whose natural scope is the lifetime of an http request. The http request object
itself is one such object. As long as the thread is the fundamental unit of concurrency in your server, you'll be ok.

That said, you should ensure that you are in fact including this into methods that will be invoked inside the request
stack, and not, say, like a background job (like sending email) that is fired off during the course of a request.

### Example

        class Foo
          include Rack::Curent

          def current_url
            "#{current_request.protocol}://#{current_request.host}/#{current_request.path}
          end
        end

## Code of Conduct
Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms, which can be found in the `CODE_OF_CONDUCT.md` file in this
repository.
