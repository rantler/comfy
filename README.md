# Getting started #

Run `rake db:migrate`, then to create some new content, navigate to `/contents/new` and enter some form values. What you've entered should appear on the home page.

To go back and edit the page you just created, going to `/contents/1/edit` should work.

# Cleaning up the sofa #
Run the following to drop the Comfy CMS tables:

```sh
rake db:migrate:down VERSION=20150913201856
```
