# powershell_task_helper

A helper library for Puppet Tasks written in PowerShell.

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with powershell_task_helper](#setup)
    * [Beginning with powershell_task_helper](#beginning-with-powershell_task_helper)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Development - Guide for contributing to the module](#development)

## Description

A PowerShell helper library for use by [Puppet Tasks](https://puppet.com/docs/bolt/latest/writing_tasks.html). It provides a function that handles error generation, simplifies JSON input and output, and makes testing your task easier. It requires Bolt >= 2.4.

## Setup

### Beginning with powershell_task_helper

To use this library, include this module in a `Puppetfile`:

```ruby
mod 'puppetlabs-powershell_task_helper'
```

Add the helper file to your [task metadata](https://puppet.com/docs/bolt/latest/writing_tasks.html#task-metadata):

```json
{
  "files": ["powershell_task_helper/files/BoltPwshHelper/"],
  "input_method": "powershell"
}
```

## Usage

Bolt automatically adds your task directory to the `$env:PSModulePath`, so PowerShell module auto loading will work without having to write out the `Import-Module` statement. If your target is using PowerShell 3.0, you will have to add an import statement.

For a complete example of using the helper file in a task, see the [examples](./examples).


## Development

Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. We can’t access the huge number of platforms and myriad of hardware, software, and deployment configurations that Puppet is intended to serve.

We want to keep it as easy as possible to contribute changes so that our modules work in your environment. There are a few guidelines that we need contributors to follow so that we can have a chance of keeping on top of things.

For more information, see the [CONTRIBUTING.md](./CONTRIBUTING.md) documentation in this module.
