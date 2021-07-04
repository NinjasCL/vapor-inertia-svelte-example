import { App } from '@inertiajs/inertia-svelte'
import { InertiaProgress } from '@inertiajs/progress'

import Layout from '@/Shared/Layout.svelte'

InertiaProgress.init()

const el = document.getElementById('app')

new App({
  target: el,
  props: {
    initialPage: JSON.parse(el.dataset.page),
    resolveComponent: (name) => {
      return import(`@/Pages/${name}.svelte`)
    }
  },
})
