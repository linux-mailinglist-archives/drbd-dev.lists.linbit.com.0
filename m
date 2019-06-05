Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id A629E427FF
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:14 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0FA3A1045C22;
	Wed, 12 Jun 2019 15:50:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 94DC61028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 18:05:32 +0200 (CEST)
Received: by mail-io1-f47.google.com with SMTP id e5so1639262iok.4
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 09:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=IDfDSrjEP/eQ/nKZONY7VFn9utanp6ZKRAcnINLMI78=;
	b=e9nhkZ5r1DioMIhwYi0rfztPX3UKUlJQhCv5XJ/TGQ+UOrYBlBXDO6yaED/jkLookt
	2jburYSLB6OGdCpTs1bTqF8uSECFHxaHO/uXNWET5lpiskaefwdR2Gsb1/zLXH2f4zVM
	P3+8XVztlMgq2k3nBUvv2XRJMbU/1oqJL+0paA2WfE608g76mgTIlnHoAn22hR/Hj9VU
	lJlUm62lOmb++SNGnhzrn6gVx0pPMknVtInFjgEIeXN85I3/g9HmwIg4HmA0hWvXn3Xf
	4Dry7Tj011Hsw7BQ9MgOCkWY2927fml5cCkcUc4bvQDZxPNvKYxv4ZSyfP27TquGJ21M
	SgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=IDfDSrjEP/eQ/nKZONY7VFn9utanp6ZKRAcnINLMI78=;
	b=BMiXWTqhcQeli9LRkwSYrzALzbD3kMSaQXz8XRTr99tIO7D4kZ69UD9rHfzbT4DZOm
	4KvTXJTs3Mdjy2/ry87gxiY7bclvsM6A7NIbRN1S47vdlRaiaKMwPzMyCn2OVKvKGV8e
	LVa1ClLJBCxOAjD9wj+CZ2wx+geW1FrBuKr3vVt2HirYFB76MKtfl60TvooOHrFQzi4O
	1zTAW126pqF499IQMX3hJXwpKMW5rRifCYEh2Ki9BAfzwyFU6y6mzXDTZJ9VsHCS+r5S
	z233pHaK9RICEtfw2/yvhYyoRNpS0VDT9HGL3H4ChH3T3LDM84xhLAlO9qiU4Ln8C7cz
	Y3mA==
X-Gm-Message-State: APjAAAUCo0VPP4vgzysFD71kH0Bj/YOH5fY7cdhx33g4uk4oP08ljpD+
	WD20vEcVKRcU9Rqo0VyBJkEKeNLj
X-Google-Smtp-Source: APXvYqwLk1INawsGlTYxzNuina4ErKbuKerqDOYhByd7qfYrc6k3NoC/T3aW867XL7vk1UxQcSzjJw==
X-Received: by 2002:a6b:3e57:: with SMTP id l84mr27206165ioa.164.1559750731916;
	Wed, 05 Jun 2019 09:05:31 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	e130sm4865273ita.2.2019.06.05.09.05.30
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:05:31 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <9ddd5d91-affe-4a82-b563-45ea6082f5df@gmail.com>
Date: Wed, 5 Jun 2019 10:05:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] avoid compiler warning about redefined macro
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

In drbd_dax_pmem.h:35:
-#define arch_wb_cache_pmem(A, L) do { } while (0)
+#define arch_wb_cache_pmem(A, S) do { } while (0)

Avoid compiler warning by making the macro definition exactly match the one in
linux/libnvdimm.h:
    drbd_dax_pmem.h:35: warning: "arch_wb_cache_pmem" redefined
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
