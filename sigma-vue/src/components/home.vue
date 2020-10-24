<template>
    <div>
        <Listbox v-model="selectedCity" :options="cities" :filter="true" optionLabel="name" />
        <label>{{selectedCity}}</label>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                selectedCity: null,
                cities: [
                    {name: 'New York', code: 'NY'},
                    {name: 'Rome', code: 'RM'},
                    {name: 'London', code: 'LDN'},
                    {name: 'Istanbul', code: 'IST'},
                    {name: 'Paris', code: 'PRS'}
                ]
            }
        }
    }
</script>

<style lang="scss" scoped>

</style>