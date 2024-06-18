<script lang="ts">
import Item from '../models/Item';

export default {
    name: 'ItemPage',
    props: {
        item: Item,
    },
    data() {
    return {
    };
  }
}

</script>

<template>
    <section>
        <div class="container is-fluid is-mobile">
            <p>{{ item?.nome }}</p>
            <p>{{ item?.desc }}</p>
            <p>{{ item?.qtd }}</p>
            <p>{{ item?.kgl }}</p>
            <p>{{ item?.categ }}</p>
            <p>{{ item?.dataVal }}</p>
        </div>
    </section>
</template>

<style>


</style>