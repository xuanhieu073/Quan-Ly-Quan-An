<template>
    <Dialog :visible="value">
        <template #header>
            <h3>Thông báo</h3>
        </template>
        {{content}}
        <template #footer>
            <Button label="OK" icon="pi pi-check" autofocus @click="hideDialog" />
        </template>
    </Dialog>
</template>

<script>
    export default {
        props: {
            value: {
                type: Boolean,
                default: false
            },
            content: '',
        },
        data() {
            return {
                d: false,
            }
        },
        methods: {
            hideDialog() {
                this.d = false;
                this.$emit('input', false)
            }
        },
    }
</script>

<style lang="scss" scoped>

</style>