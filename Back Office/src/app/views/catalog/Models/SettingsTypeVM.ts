export class SettingsTypeVM {
    name?: string;
    description?: string;
    id?: number = 0;
    parentKeyCode?: string;
    keyCode: string = "";
    isSystemDefined = false;
    parentId: number = 0;
    isActive?: Boolean;
    parentName?: string
    uploadStatus: Boolean = false;
    istAccountLevel: Boolean = false;
}