<script lang="ts" setup>
import { useBlockchain, useFormatter } from '@/stores';
import { useWasmStore } from './WasmStore';
import { ref } from 'vue';
import type { PaginabledCodeInfos } from './types';

const props = defineProps(['chain'])

const codes = ref({} as PaginabledCodeInfos)

const wasmStore = useWasmStore()
wasmStore.wasmClient.getWasmCodeList().then(x =>{ 
    codes.value = x
})
</script>
<template>
    <div>
        <VCard>
            <VCardTitle>Cosmos Wasm</VCardTitle>
            <VTable>
                <thead>
                    <tr><th>Code Id</th><th>Creator</th><th>Code Hash</th><th>Permissions</th></tr>
                </thead>
                <tbody>
                    <tr v-for="v in codes.code_infos">
                        <td>{{ v.code_id }}</td>
                        <td>{{ v.creator }}</td>
                        <td><RouterLink :to="`/${props.chain}/cosmwasm/${v.code_id}/contracts`"><div class="text-truncate" style="max-width: 200px;">{{ v.data_hash }}</div></RouterLink></td>
                        <td>{{ v.instantiate_permission }}</td>
                    </tr>
                </tbody>
            </VTable>
        </VCard> 
    </div>
</template>

<route>
    {
      meta: {
        i18n: 'cosmwasm'
      }
    }
</route>