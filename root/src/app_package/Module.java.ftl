package ${modulePackageName};

<#if needActivity>
import com.jess.arms.di.scope.ActivityScope;
<#elseif needFragment>
import com.jess.arms.di.scope.FragmentScope;
</#if>

import dagger.Module;
import dagger.Provides;

import ${contractPackageName}.${pageName}Contract;
import ${modelPackageName}.${pageName}Model;

@Module
public class ${pageName}Module {
    private ${pageName}Contract.View view;

    /**
     * 构建${pageName}Module时,将View的实现类传进来,这样就可以提供View的实现类给presenter
     * @param view
     */
    public ${pageName}Module(${pageName}Contract.View view) {
        this.view = view;
    }

    <#if needActivity>@ActivityScope<#elseif needFragment>@FragmentScope</#if>
    @Provides
    ${pageName}Contract.View provide${pageName}View(){
        return this.view;
    }

    <#if needActivity>@ActivityScope<#elseif needFragment>@FragmentScope</#if>
    @Provides
    ${pageName}Contract.Model provide${pageName}Model(${pageName}Model model){
        return model;
    }

    <#if needActivity>
    /**
     * 当需要在Activity中通过@Inject注入Fragment时，需要将对应的Fragment在ActivityModule中@Provides
     *
     * @return
     */
    // // @Singleton  // 作用域不同
    // @ActivityScope
    // @Provides
    // Fragment provideFragment() {
    //     return new Fragment();
    // }
    </#if>
}