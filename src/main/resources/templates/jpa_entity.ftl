<#-- Java 实体模板 -->
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


/**
* @description ${classComment}
* @author Arvin Du
* @date ${.now?string("yyyy-MM-dd")}
*/
@Entity
@Data
@Table(name="${tableName}")
@Builder
@AllArgsConstructor
@NoArgsConstructor
@DynamicUpdate
@DynamicInsert
public class ${className} implements Serializable {

    <#-- 序列化 -->
    private static final long serialVersionUID = 1L;

<#-- 循环生成字段 ---------->
<#list fieldList as field>
    <#if field.comment!?length gt 0>
    /**
     * ${field.comment}
     */
    </#if>
    <#if field.primaryKey>
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    </#if>
    @Column(name="${field.columnName}")
    private ${field.javaType} ${field.fieldName};

</#list>
}
