<script context="module">
    import Layout, { title } from '@/Shared/Layout.svelte'
    export const layout = Layout
</script>

<script>
    import {inertia, page} from '@inertiajs/inertia-svelte';
    
    const { routes, welcome } = $page.props;

    $title = "The Future is Now!"

</script>

<h1>Welcome</h1>
<ul>
    <li>{welcome}</li>
</ul>
<a
use:inertia
href={routes.home.uri}
>Click Here for Home!</a>